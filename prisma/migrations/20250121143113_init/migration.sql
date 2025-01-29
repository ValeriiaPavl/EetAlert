-- CreateTable
CREATE TABLE "Product" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "product_name" TEXT NOT NULL,
    "identification_marks" TEXT NOT NULL,
    "product_image" TEXT NOT NULL,
    "shopId" INTEGER NOT NULL,
    "created_at" DATETIME NOT NULL,
    "added_at_shop_site" DATETIME NOT NULL,
    "problem_description" TEXT NOT NULL,
    "link_info" TEXT NOT NULL,
    CONSTRAINT "Product_shopId_fkey" FOREIGN KEY ("shopId") REFERENCES "Shop" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Shop" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "shopName" TEXT NOT NULL,
    "shopLabel" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL
);
