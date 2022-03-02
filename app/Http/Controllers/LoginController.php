<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Http\Request;
use App\Models\Customer;

class LoginController extends Controller
{
    //
    public function login(){
        return view('pages.login.login');
    }
    public function loginSubmit(Request $req){
        $c = Customer::where('phone',$req->phone)
                  ->where('password',$req->password)
                  ->first();
        if($c){
            session()->put('user',$c->id);
            if ($req->remember) {
                setcookie('remember',$req->phone, time()+36000);
                Cookie::queue('name',$c->phone."This is for testing",time()+60);
            }else{
                setcookie('remember',"");
                Cookie::queue('name',"");
            }
            return redirect()->route('products.mycart');
        }
        return redirect()->route('login');

    }
    public function logout(){
        session()->flush();
        return redirect()->route('login');
    }
    
}
