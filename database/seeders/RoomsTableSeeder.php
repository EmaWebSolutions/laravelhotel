<?php
namespace Database\Seeders;
use Illuminate\Database\Seeder;
use App\Models\Room;
class RoomsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
       Room::factory()->count(30)->create();
    }
}
