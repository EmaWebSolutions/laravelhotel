<?php
namespace Database\Seeders;
use Illuminate\Database\Seeder;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use App\Models\User;
class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
 
        DB::table('users')->insert([
            'first_name' => "admin",
            'last_name' => "admin",
            'gender' => "male",
            'phone' => "0912118872",
            'address' => "Brgy.Enclaro,Binalbagan,Negros Occidental",
            'email' => "admin@gmail.com",
            'password' => bcrypt('password'),
            'avatar' => 'boy-1.png',
            'about' => "hello from the other world",
            'role' => 'admin',
            'status' => TRUE,
            'remember_token' => str_random(10),
            'created_at' => Carbon::now()->format('Y-m-d H:i:s')
        ]);
        User::factory()->count(10)->create();
    }
}
