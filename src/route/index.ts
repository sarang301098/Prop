import { Router } from 'express';

import governmentHolidays from './governmentHolidays';
import deliverylocations from './deliveryLocations';
import driverManageStock from './driverManageStock';
import vendorMangeStock from './vendorMangeStock';
import membershipPlans from './membershipPlans';
import emailTemplates from './emailTemplates';
import vendorProducts from './vendorProducts';
import notification from './notification';
import cylinderSize from './cylinderSize';
import subAdmin from './subAdminDetails';
import userAddress from './userAddress';
import appSettings from './appSettings';
import accessories from './accessories';
import transaction from './transaction';
import promocodes from './promocodes';
import categories from './category';
import timeSlots from './timeSlots';
import userCards from './userCards';
import contactus from './contactUs';
import customers from './customers';
import dashboard from './dashboard';
import products from './products';
import earnings from './earnings';
import cmsPages from './cmsPages';
import zipcode from './zipcode';
import ratings from './Ratings';
import vendors from './vendors';
import webhook from './webhook';
import drivers from './drivers';
import reports from './reports';
import modules from './module';
import county from './county';
import stripe from './stripe';
import orders from './orders';
import state from './state';
import roles from './Roles';
import users from './users';
import cart from './cart';
import auth from './auth';
import faqs from './faqs';
import map from './map';

const routes = Router();

routes.get('/', (req, res) => res.status(400).json({ message: 'Access not allowed' }));

routes.use('/governmentHolidays', governmentHolidays());
routes.use('/deliverylocations', deliverylocations());
routes.use('/driverManageStock', driverManageStock());
routes.use('/vendorMangeStock', vendorMangeStock());
routes.use('/membershipPlans', membershipPlans());
routes.use('/emailtemplates', emailTemplates());
routes.use('/vendorProducts', vendorProducts());
routes.use('/notifications', notification());
routes.use('/cylinderSize', cylinderSize());
routes.use('/appsettings', appSettings());
routes.use('/userAddress', userAddress());
routes.use('/accessories', accessories());
routes.use('/transaction', transaction());
routes.use('/promocodes', promocodes());
routes.use('/categories', categories());
routes.use('/timeslots', timeSlots());
routes.use('/contactus', contactus());
routes.use('/usercards', userCards());
routes.use('/customers', customers());
routes.use('/dashboard', dashboard());
routes.use('/subAdmins', subAdmin());
routes.use('/cmspages', cmsPages());
routes.use('/products', products());
routes.use('/earnings', earnings());
routes.use('/zipcodes', zipcode());
routes.use('/vendors', vendors());
routes.use('/ratings', ratings());
routes.use('/counties', county());
routes.use('/modules', modules());
routes.use('/webhook', webhook());
routes.use('/drivers', drivers());
routes.use('/reports', reports());
routes.use('/stripe', stripe());
routes.use('/orders', orders());
routes.use('/states', state());
routes.use('/users', users());
routes.use('/roles', roles());
routes.use('/cart', cart());
routes.use('/auth', auth());
routes.use('/faqs', faqs());
routes.use('/map', map());
export default (): Router => routes;
