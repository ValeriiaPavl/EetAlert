/*
  Warnings:

  - You are about to drop the column `identification_marks` on the `Product` table. All the data in the column will be lost.
  - You are about to drop the column `link_info` on the `Product` table. All the data in the column will be lost.
  - You are about to drop the column `problem_description` on the `Product` table. All the data in the column will be lost.
  - You are about to drop the column `product_image` on the `Product` table. All the data in the column will be lost.
  - You are about to drop the column `product_name` on the `Product` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[shopName]` on the table `Shop` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `identificationMarks` to the `Product` table without a default value. This is not possible if the table is not empty.
  - Added the required column `linkInfo` to the `Product` table without a default value. This is not possible if the table is not empty.
  - Added the required column `problemDescription` to the `Product` table without a default value. This is not possible if the table is not empty.
  - Added the required column `productImage` to the `Product` table without a default value. This is not possible if the table is not empty.
  - Added the required column `productName` to the `Product` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Product" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "productName" TEXT NOT NULL,
    "identificationMarks" TEXT NOT NULL,
    "productImage" TEXT NOT NULL,
    "shopId" INTEGER NOT NULL,
    "created_at" DATETIME NOT NULL,
    "added_at_shop_site" DATETIME NOT NULL,
    "problemDescription" TEXT NOT NULL,
    "linkInfo" TEXT NOT NULL,
    CONSTRAINT "Product_shopId_fkey" FOREIGN KEY ("shopId") REFERENCES "Shop" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Product" ("added_at_shop_site", "created_at", "id", "shopId") SELECT "added_at_shop_site", "created_at", "id", "shopId" FROM "Product";
DROP TABLE "Product";
ALTER TABLE "new_Product" RENAME TO "Product";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;

-- CreateIndex
CREATE UNIQUE INDEX "Shop_shopName_key" ON "Shop"("shopName");
