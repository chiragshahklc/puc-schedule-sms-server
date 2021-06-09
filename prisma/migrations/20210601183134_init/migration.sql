-- CreateTable
CREATE TABLE `User` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `fullName` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191),
    `password` VARCHAR(191) NOT NULL,
    `contactNo` VARCHAR(191) NOT NULL,
    `username` VARCHAR(191) NOT NULL,
    `createdOn` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `modifiedOn` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Customer` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `contactNo` VARCHAR(191) NOT NULL,
    `vehicleNo` VARCHAR(191) NOT NULL,
    `createdOn` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `modifiedOn` DATETIME(3) NOT NULL,
    `createdBy` INTEGER NOT NULL,
    `modifiedBy` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ScheduleMessage` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `customer` INTEGER NOT NULL,
    `expiryDaye` DATE NOT NULL,
    `createdOn` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `modifiedOn` DATETIME(3) NOT NULL,
    `createdBy` INTEGER NOT NULL,
    `modifiedBy` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `SentMessage` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `customer` INTEGER NOT NULL,
    `messageId` VARCHAR(191) NOT NULL,
    `messageStatus` VARCHAR(191) NOT NULL,
    `createdOn` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `modifiedOn` DATETIME(3) NOT NULL,
    `createdBy` INTEGER NOT NULL,
    `modifiedBy` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `SentMessage` ADD FOREIGN KEY (`customer`) REFERENCES `Customer`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SentMessage` ADD FOREIGN KEY (`createdBy`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SentMessage` ADD FOREIGN KEY (`modifiedBy`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ScheduleMessage` ADD FOREIGN KEY (`customer`) REFERENCES `Customer`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ScheduleMessage` ADD FOREIGN KEY (`createdBy`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ScheduleMessage` ADD FOREIGN KEY (`modifiedBy`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Customer` ADD FOREIGN KEY (`createdBy`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Customer` ADD FOREIGN KEY (`modifiedBy`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
