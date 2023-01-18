/*
  Warnings:

  - You are about to drop the column `habitId` on the `habit_week_days` table. All the data in the column will be lost.
  - You are about to drop the column `week_day` on the `habit_week_days` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[habit_id,weekDays]` on the table `habit_week_days` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `weekDays` to the `habit_week_days` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "habit_week_days" DROP CONSTRAINT "habit_week_days_habitId_fkey";

-- DropIndex
DROP INDEX "habit_week_days_habit_id_week_day_key";

-- AlterTable
ALTER TABLE "habit_week_days" DROP COLUMN "habitId",
DROP COLUMN "week_day",
ADD COLUMN     "weekDays" INTEGER NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "habit_week_days_habit_id_weekDays_key" ON "habit_week_days"("habit_id", "weekDays");

-- AddForeignKey
ALTER TABLE "habit_week_days" ADD CONSTRAINT "habit_week_days_habit_id_fkey" FOREIGN KEY ("habit_id") REFERENCES "habits"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
