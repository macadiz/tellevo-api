/*
  Warnings:

  - You are about to drop the column `travel_id` on the `user` table. All the data in the column will be lost.
  - Added the required column `driver_id` to the `travel` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `travel` ADD COLUMN `driver_id` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `user` DROP COLUMN `travel_id`;

-- AddForeignKey
ALTER TABLE `travel` ADD CONSTRAINT `travel_driver_id_fkey` FOREIGN KEY (`driver_id`) REFERENCES `user`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
