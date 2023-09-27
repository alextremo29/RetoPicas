<?php
namespace App\Http\Controllers;

use App\Models\User;
use App\Traits\ApiResponser;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class UserController extends Controller
{
    use ApiResponser;

    /**
     * Retorna una lista de usuarios
     * @return Illuminate/Http/Response
     */
    public function index()
    {
        // Retorna toda la lista de autores agregados
        $users = User::all();
        return $this->successResponse($users);
    }

    /**
     * Almacena un usuario dado
     * @return Illuminate/Http/Response
     */
    public function store(Request $request)
    {
        $response;
        // Reglas de validación para los datos del usuario
        $rules = [
            'email'    => 'required|email|unique:users',
            'nombre'   => 'required|max:255',
            'apellido' => 'required|max:255',
            'fecha'    => 'required|date_format:Y-m-d',
        ];
        try {
            $validate = \Validator::make($request->all(), $rules);

            if ($validate->fails()) {
                throw new \Exception(json_encode($validate->errors()), Response::HTTP_UNPROCESSABLE_ENTITY);
            }

            // Se crea al usuario usando el request dado, en caso de venir mas datos esos son ignorados
            $user = User::create($request->all());

            return $this->successResponse($user, Response::HTTP_CREATED);

        } catch (\Exception $e) {
            return $this->errorResponse($e->getMessage(), $e->getCode());
        }
    }
}
