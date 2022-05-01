<?php

use App\Http\Controllers\PermissionController;
use App\Models\Permission;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\AuthenticatedSessionController;
use App\Http\Controllers\PostController;
use Illuminate\Support\Facades\Gate;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('home');
});
Route::get('/permissions/show', [PermissionController::class, "show"]);

Route::get('/dashboard', function () {
    return view('home');
})->middleware(['auth'])->name('dashboard');
Route::get('logout', [AuthenticatedSessionController::class, 'destroy']);
require __DIR__ . '/auth.php';

Route::middleware('auth')->group(function () {
    Route::get('/posts', [PostController::class, "index"])->name('posts');
    Route::put('/posts/update', [PostController::class, "update"]);
    Route::get('/posts/delete/{id}', [PostController::class, "destroy"]);
    Route::put('/permissions/edit/{id}', [PermissionController::class, "update"]);
    Route::get('/permissions', [PermissionController::class, "index"])->name('permissions');
    Route::get('/permissions/create', [PermissionController::class, "create"]);
    Route::post('/posts/create', [PostController::class, "create"]);
});
