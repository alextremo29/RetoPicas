<?php
namespace App\Traits;

use Illuminate\Http\Response;
use Illuminate\Support\Facades\Log;

trait ApiResponser
{

    /**
     * Construir una respuesta de exito
     *
     * @param      string|array  $data
     * @param      int  $code
     *
     * @return     Illuminate\Http\Response  (Respuesta correcta del consumo)
     */
    public function successResponse($data, $code = Response::HTTP_OK)
    {
        $datosLog = [
            "code" => $code,
            "data" => $data,
        ];
        Log::channel('ejecucion')->info('Ejecución satisfactoria', $datosLog);
        return response()->json([
            'data' => $data,
        ], $code);

    }

    /**
     * Construir un mensaje de error
     *
     * @param      string|array  $data
     * @param      int  $code
     *
     * @return     Illuminate\Http\Response  (Respuesta erronea del consumo)
     */
    public function errorResponse($message, $code)
    {
        // El mensaje de error puede ser un json o un string se valida
        $mensajeJson = json_decode($message);
        if ($mensajeJson !== null) {
            $message = $mensajeJson;
        }

        $datosLog = [
            "code" => $code,
            "data" => $message,
        ];
        Log::channel('ejecucion')->error('Error de ejecución', $datosLog);

        // Aqui pueden llegar todos los codigos internos que maneja laravel
        // se valida si el codigo que llega hace parte de los codigos disponibles en http
        if ($code >= 600) {
            $code = 500;
        }

        return response()->json([
            'error' => $message,
            'code'  => $code,
        ], $code);

    }
}
