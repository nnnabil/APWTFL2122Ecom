<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\CustomerController;
use App\Http\Controllers\HomeController;

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
    return redirect()->route('login');
});
//login
Route::get('/login',[LoginController::class,'login'])->name('login');
Route::post('/login',[LoginController::class,'loginSubmit'])->name('login');
/**product routes */
Route::get('/products/list',[ProductController::class,'list'])->name('products.list');
Route::get('/addtocart/{id}',[ProductController::class,'addtocart'])->name('products.addtocart');
Route::get('/emptycart',[ProductController::class,'emptycart'])->name('products.emptycart');
Route::get('/cart',[ProductController::class,'mycart'])->name('products.mycart');
Route::post('/checkout',[ProductController::class,'checkout'])->middleware('LoggedInCustomer')->name('checkout');
// Add Product
Route::get('/addProduct',[ProductController::class,'addProduct'])->name('addProduct');
Route::post('/addProduct',[ProductController::class,'addProductSubmit'])->name('addProduct');
/**product routes end */
       
Route::get('/customer/myorders',[CustomerController::class,'myorders'])
->middleware('LoggedInCustomer')->name('customer.myorders');
Route::get('/logout',[LoginController::class,'logout'])->name('logout');
Route::get('/customer/myorders/details/{id}',[CustomerController::class,'orderdetails'])->middleware('LoggedInCustomer')->name('customer.myorders.details');

//customer edit
Route::get('/customer/profile',[CustomerController::class,'profile'])->middleware('LoggedInCustomer')->name('profile');
Route::post('/customer/profile',[CustomerController::class,'profileSubmit'])->middleware('LoggedInCustomer')->name('profileSubmit');

Route::get('my-demo-mail', [HomeController::class, 'myDemoMail']);