/*
  Warnings:

  - Added the required column `updated_at` to the `Product` table without a default value. This is not possible if the table is not empty.

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
    "updated_at" DATETIME NOT NULL,
    "added_at_shop_site" DATETIME NOT NULL,
    "problemDescription" TEXT NOT NULL,
    "linkInfo" TEXT NOT NULL,
    CONSTRAINT "Product_shopId_fkey" FOREIGN KEY ("shopId") REFERENCES "Shop" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Product" ("added_at_shop_site", "created_at", "id", "identificationMarks", "linkInfo", "problemDescription", "productImage", "productName", "shopId") SELECT "added_at_shop_site", "created_at", "id", "identificationMarks", "linkInfo", "problemDescription", "productImage", "productName", "shopId" FROM "Product";
DROP TABLE "Product";
ALTER TABLE "new_Product" RENAME TO "Product";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
