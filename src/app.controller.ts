import { Controller, Get, Param, Post, Body, Put } from '@nestjs/common';
import { ShopService } from './shop.service';
import { ProductService } from './product.service';
import { Shop as ShopModel, Product as ProductModel } from '@prisma/client';

@Controller()
export class AppController {
  constructor(
    private readonly shopService: ShopService,
    private readonly productService: ProductService,
  ) {}

  @Get('product/:id')
  async getProductById(
    @Param('id') id: number,
  ): Promise<ProductModel | undefined> {
    try {
      await this.productService.product({ id: Number(id) });
    } catch (error) {
      console.error(error);
      return undefined;
    }
  }

  @Get('products')
  async getAllProducts(): Promise<ProductModel[]> {
    return this.productService.products({});
  }

  @Get('filtered-products/:searchString')
  async getFilteredProducts(
    @Param('searchString') searchString: string,
  ): Promise<ProductModel[]> {
    return this.productService.products({
      where: {
        OR: [
          {
            productName: { contains: searchString },
          },
          {
            problemDescription: { contains: searchString },
          },
        ],
      },
    });
  }

  @Post('product')
  async createProduct(
    @Body()
    productData: {
      productName: string;
      problemDescription: string;
      identificationMarks: string;
      productImage: string;
      shopId: number;
      linkInfo: string;
      level: string;
      added_at_shop: Date;
    },
  ): Promise<ProductModel> {
    const {
      productName,
      problemDescription,
      productImage,
      identificationMarks,
      shopId,
      linkInfo,
      added_at_shop,
      level,
    } = productData;
    return this.productService.createProduct({
      productName,
      productImage,
      problemDescription,
      identificationMarks,
      linkInfo: linkInfo,
      added_at_shop_site: added_at_shop,
      level: level,
      shop: {
        connect: { id: shopId },
      },
    });
  }

  @Get('shops')
  async getAllShops(): Promise<ShopModel[]> {
    return this.shopService.getShops({});
  }
  @Post('shop')
  async addShop(
    @Body() shopData: { shopName: string; shopLabel: string },
  ): Promise<ShopModel> {
    return this.shopService.createShop(shopData);
  }

  @Put('change/:product_id')
  async changeProduct(
    @Param('product_id') id: string,
    @Body()
    productData: {
      productName?: string;
      problemDescription?: string;
      identificationMarks?: string;
      productImage?: string;
      shopName?: string;
      linkInfo?: string;
    },
  ): Promise<ProductModel> {
    console.log(id);
    const updatedProduct = await this.productService.updateProduct({
      where: { id: Number(id) },
      data: productData,
    });
    return updatedProduct;
  }
}
