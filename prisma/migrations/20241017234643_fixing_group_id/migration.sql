/*
  Warnings:

  - You are about to drop the column `groupId` on the `user` table. All the data in the column will be lost.
  - Added the required column `group_id` to the `user` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `user` DROP FOREIGN KEY `user_groupId_fkey`;

-- AlterTable
ALTER TABLE `user` DROP COLUMN `groupId`,
    ADD COLUMN `group_id` INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE `user` ADD CONSTRAINT `user_group_id_fkey` FOREIGN KEY (`group_id`) REFERENCES `group`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
