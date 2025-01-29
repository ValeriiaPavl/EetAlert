import { Injectable } from '@nestjs/common';
import { PrismaService } from './prisma.service';
import { Shop, Prisma } from '@prisma/client';

@Injectable()
export class ShopService {
  constructor(private prisma: PrismaService) {}

  async shop(
    shopWhereUniqueInput: Prisma.ShopWhereUniqueInput,
  ): Promise<Shop | null> {
    return this.prisma.shop.findUnique({
      where: shopWhereUniqueInput,
    });
  }

  async getShops(params: {
    skip?: number;
    take?: number;
    cursor?: Prisma.ShopWhereUniqueInput;
    where?: Prisma.ShopWhereInput;
    orderBy?: Prisma.ShopOrderByWithRelationInput;
  }): Promise<Shop[]> {
    const { skip, take, cursor, where, orderBy } = params;
    return this.prisma.shop.findMany({
      skip,
      take,
      cursor,
      where,
      orderBy,
    });
  }

  async createShop(data: Prisma.ShopCreateInput): Promise<Shop> {
    return this.prisma.shop.create({
      data,
    });
  }

  async updateShop(params: {
    where: Prisma.ShopWhereUniqueInput;
    data: Prisma.ShopUpdateInput;
  }): Promise<Shop> {
    const { where, data } = params;
    return this.prisma.shop.update({
      data,
      where,
    });
  }
}
