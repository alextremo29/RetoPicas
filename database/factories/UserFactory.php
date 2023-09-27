<?php
namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\User>
 */
class UserFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'email'    => $this->faker->unique()->safeEmail,
            'nombre'   => $this->faker->firstName,
            'apellido' => $this->faker->lastName,
            'fecha'    => $this->faker->date,
        ];
    }
}
