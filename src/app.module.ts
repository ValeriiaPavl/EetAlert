import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { ConfigModule } from '@nestjs/config';
import { ProductService } from './product.service';
import { ShopService } from './shop.service';
import { PrismaService } from './prisma.service';
import { EventsGateway } from './events/events.gateway';

@Module({
  imports: [ConfigModule.forRoot()],
  controllers: [AppController],
  providers: [ProductService, ShopService, PrismaService, EventsGateway],
})
export class AppModule {}
