/*
  Warnings:

  - Added the required column `level` to the `Product` table without a default value. This is not possible if the table is not empty.

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
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "added_at_shop_site" DATETIME NOT NULL,
    "problemDescription" TEXT NOT NULL,
    "linkInfo" TEXT NOT NULL,
    "level" TEXT NOT NULL,
    CONSTRAINT "Product_shopId_fkey" FOREIGN KEY ("shopId") REFERENCES "Shop" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Product" ("added_at_shop_site", "created_at", "id", "identificationMarks", "linkInfo", "problemDescription", "productImage", "productName", "shopId", "updated_at") SELECT "added_at_shop_site", "created_at", "id", "identificationMarks", "linkInfo", "problemDescription", "productImage", "productName", "shopId", "updated_at" FROM "Product";
DROP TABLE "Product";
ALTER TABLE "new_Product" RENAME TO "Product";
CREATE TABLE "new_Shop" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "shopName" TEXT NOT NULL,
    "shopLabel" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_Shop" ("created_at", "id", "shopLabel", "shopName") SELECT "created_at", "id", "shopLabel", "shopName" FROM "Shop";
DROP TABLE "Shop";
ALTER TABLE "new_Shop" RENAME TO "Shop";
CREATE UNIQUE INDEX "Shop_shopName_key" ON "Shop"("shopName");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
