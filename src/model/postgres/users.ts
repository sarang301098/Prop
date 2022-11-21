import {
  Column,
  Entity,
  BaseEntity,
  DeleteDateColumn,
  CreateDateColumn,
  UpdateDateColumn,
  PrimaryGeneratedColumn,
} from 'typeorm';

@Entity('users', { schema: 'public' })
export class Users extends BaseEntity {
  @PrimaryGeneratedColumn('uuid')
  id!: string;

  @Column('varchar', { length: 255, nullable: true })
  fullName!: string;

  @Column('varchar', { length: 255, nullable: true })
  email!: string;

  @Column('varchar', { nullable: true })
  password!: string;

  @Column('varchar', { nullable: true })
  countryCode!: string | null;

  @Column('varchar', { nullable: true })
  mobileNumber!: string | null;

  @Column('varchar', { nullable: true })
  profileImage!: string;

  @CreateDateColumn({ type: 'timestamp', nullable: true })
  createdAt!: Date;

  @UpdateDateColumn({ type: 'timestamp' })
  updatedAt!: Date | null;

  @DeleteDateColumn({ type: 'timestamp' })
  deletedAt!: Date | null;

  @Column('boolean', { default: () => 'true' })
  isActive!: boolean;
}
