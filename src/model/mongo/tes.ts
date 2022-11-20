import {
  Column,
  Entity,
  PrimaryGeneratedColumn,
  CreateDateColumn,
  UpdateDateColumn,
  DeleteDateColumn,
  BaseEntity,
} from 'typeorm';

@Entity('tes', { schema: 'public' })
export class Tes extends BaseEntity {
  @PrimaryGeneratedColumn('increment')
  id!: number;

  @Column('varchar', { length: 255 })
  name!: string;

  @Column('varchar', { length: 255 })
  image!: string;

  @Column('integer', { nullable: true })
  price!: number;

  @Column('varchar', { nullable: true })
  description!: string | null;

  @Column('integer', { nullable: true, default: () => '1' }) // 0 = notApproved, 1 = approved, 2 = pending
  status!: number | null;

  @CreateDateColumn({ type: 'timestamp' })
  createdAt!: Date | null;

  @UpdateDateColumn({ type: 'timestamp' })
  updatedAt!: Date | null;

  @DeleteDateColumn({ type: 'timestamp' })
  deletedAt!: Date | null;

  @Column('varchar', { nullable: true })
  createdBy!: string | null;

  @Column('varchar', { nullable: true })
  updatedBy!: string | null;
}
