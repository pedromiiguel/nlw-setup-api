/*
  Warnings:

  - You are about to drop the column `weekDays` on the `habit_week_days` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[habit_id,week_day]` on the table `habit_week_days` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `week_day` to the `habit_week_days` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "habit_week_days_habit_id_weekDays_key";

-- AlterTable
ALTER TABLE "habit_week_days" DROP COLUMN "weekDays",
ADD COLUMN     "week_day" INTEGER NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "habit_week_days_habit_id_week_day_key" ON "habit_week_days"("habit_id", "week_day");
