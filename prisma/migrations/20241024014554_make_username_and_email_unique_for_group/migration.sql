/*
  Warnings:

  - A unique constraint covering the columns `[group_id,username]` on the table `user` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[group_id,email]` on the table `user` will be added. If there are existing duplicate values, this will fail.

*/
-- DropIndex
DROP INDEX `user_email_key` ON `user`;

-- DropIndex
DROP INDEX `user_username_key` ON `user`;

-- CreateIndex
CREATE UNIQUE INDEX `user_group_id_username_key` ON `user`(`group_id`, `username`);

-- CreateIndex
CREATE UNIQUE INDEX `user_group_id_email_key` ON `user`(`group_id`, `email`);
