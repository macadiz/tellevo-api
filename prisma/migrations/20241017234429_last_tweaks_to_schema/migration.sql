/*
  Warnings:

  - You are about to drop the `Group` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Location` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `TravelPassenger` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `TravelPassenger` DROP FOREIGN KEY `TravelPassenger_group_id_fkey`;

-- DropForeignKey
ALTER TABLE `TravelPassenger` DROP FOREIGN KEY `TravelPassenger_travelId_fkey`;

-- DropForeignKey
ALTER TABLE `TravelPassenger` DROP FOREIGN KEY `TravelPassenger_userId_fkey`;

-- DropForeignKey
ALTER TABLE `travel` DROP FOREIGN KEY `travel_group_id_fkey`;

-- DropForeignKey
ALTER TABLE `travel` DROP FOREIGN KEY `travel_location_id_fkey`;

-- DropForeignKey
ALTER TABLE `user` DROP FOREIGN KEY `user_groupId_fkey`;

-- DropTable
DROP TABLE `Group`;

-- DropTable
DROP TABLE `Location`;

-- DropTable
DROP TABLE `TravelPassenger`;

-- CreateTable
CREATE TABLE `travel_passenger` (
    `id` VARCHAR(191) NOT NULL,
    `travel_id` VARCHAR(191) NOT NULL,
    `user_id` VARCHAR(191) NOT NULL,
    `paid` BOOLEAN NOT NULL,
    `group_id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `location` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `latitude` VARCHAR(191) NOT NULL,
    `longitude` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `group` (
    `id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `user` ADD CONSTRAINT `user_groupId_fkey` FOREIGN KEY (`groupId`) REFERENCES `group`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `travel` ADD CONSTRAINT `travel_location_id_fkey` FOREIGN KEY (`location_id`) REFERENCES `location`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `travel` ADD CONSTRAINT `travel_group_id_fkey` FOREIGN KEY (`group_id`) REFERENCES `group`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `travel_passenger` ADD CONSTRAINT `travel_passenger_group_id_fkey` FOREIGN KEY (`group_id`) REFERENCES `group`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `travel_passenger` ADD CONSTRAINT `travel_passenger_travel_id_fkey` FOREIGN KEY (`travel_id`) REFERENCES `travel`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `travel_passenger` ADD CONSTRAINT `travel_passenger_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
