import {
  getManager,
  getRepository,
  getCustomRepository,
  FindConditions,
  ILike,
  Not,
} from 'typeorm';
import { Request, Response } from 'express';
import { Joi } from 'express-validation';

import { BadRequestError } from '../error';
import { AccessoriesRepository } from '../repository/Accessories';

import { Accessories } from '../model/Accessory';

type ISerachObject = {
  where?: FindConditions<Accessories>;
  take?: number;
  skip?: number;
};

export const getAccessoriesValidation = {
  query: Joi.object({
    search: Joi.string().max(50).optional().allow('').default(null),
    page: Joi.number().integer().min(1).default(1),
    perPage: Joi.number().integer().min(1).default(10),
    isFilters: Joi.boolean().default(true),
  }),
};
export const getAll = () => async (req: Request, res: Response): Promise<void> => {
  const {
    query: { search, page, perPage, isFilters },
  } = req;
  const accessoryRepository = getCustomRepository(AccessoriesRepository);
  let searchObject: ISerachObject = {};

  let where: FindConditions<Accessories> = {};

  if (search && search !== '') {
    where = { ...where, name: ILike(`%${search}%`) };
  }

  const limit = Number(perPage);
  const offset = (Number(page) - 1) * limit;

  if (isFilters) {
    searchObject = {
      where,
      take: limit,
      skip: offset,
    };
  }

  const [accessories, count] = await accessoryRepository.findAndCount(searchObject);

  res.status(200).json({ count, accessories });
};

const namePattern = '^[A-za-z]';
export const createAccessoryValidation = {
  body: Joi.object({
    name: Joi.string().max(255).regex(new RegExp(namePattern)).required(),
    image: Joi.string().min(1),
    price: Joi.number().default(0),
    description: Joi.string().min(1),
  }),
};
export const createAccessory = () => async (req: Request, res: Response): Promise<void> => {
  const {
    user,
    body: { name, image, price, description },
  } = req;
  const accessoryRepository = getRepository(Accessories);

  const existingAccessory = await accessoryRepository.findOne({
    where: { name }, // TODO: price, description
  });

  if (existingAccessory) {
    throw new BadRequestError(`Accessory is already added`, 'ACCESSORY_ALREADY_EXIST');
  }

  let accessoryData = accessoryRepository.create({
    name,
    image,
    price,
    description,
    createdBy: user?.id,
    updatedBy: user?.id,
  });

  accessoryData = await accessoryRepository.save(accessoryData);
  await accessoryRepository.save(accessoryData);

  res.status(201).json(accessoryData);
};

export const updateAccessoryValidation = {
  body: Joi.object({
    name: Joi.string().max(255).regex(new RegExp(namePattern)).required(),
    image: Joi.string().min(1).optional(),
    price: Joi.number().default(0),
    description: Joi.string().min(1),
  }),
};
export const updateAccessory = () => async (req: Request, res: Response): Promise<void> => {
  const {
    user,
    body: { name, image, price, description },
    params: { id },
  } = req;

  const accessoryRepository = getCustomRepository(AccessoriesRepository);

  const accessoryById = await accessoryRepository.findOneOrFail(id);
  const uniqAccessory = await accessoryRepository.findOne({ where: { id: Not(id), name } });
  if (uniqAccessory) {
    throw new BadRequestError(`Accessory is already added`, 'ACCESSORY_ALREADY_EXIST');
  }

  if (name) accessoryById.name = name as string;
  if (image) accessoryById.image = image as string;
  if (price) accessoryById.price = price as number;
  if (description) accessoryById.description = description as string;
  accessoryById.updatedBy = user?.id;

  await accessoryRepository.save(accessoryById);

  res.sendStatus(204);
};

export const deleteAccessoryValidation = {
  params: Joi.object({ id: Joi.number().required() }),
};
export const removeAccessory = () => async (req: Request, res: Response): Promise<void> => {
  const {
    user: { id: userId },
    params: { id },
  } = req;

  await getManager().transaction(async (em) => {
    await em.update(Accessories, { id }, { updatedBy: userId });
    await em.softDelete(Accessories, id);
  });

  res.sendStatus(204);
};
