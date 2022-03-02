<?php

namespace App\Http\Controllers;

use App\Models\Customer;
use Illuminate\Http\Request;
use App\Models\Order;

class CustomerController extends Controller
{
    //
    public function myOrders(){
        $customer_id = session()->get('user');
        $orders = Order::where('customer_id',$customer_id)->get();
        return view('pages.customer.myorders')->with('orders',$orders);
    }
    public function orderdetails(Request $request){
        $id = $request->id;
        $order = Order::where('id',$id)->first();
        //return $order->products[0]->order->customer;
        return view('pages.customer.orderdetails')->with('order',$order);
    }
    public function profile(){
        $customer_id = session()->get('user');
        $c = Customer::where('id', $customer_id)->first();
        return view('pages.customer.profile')->with('c',$c);
    }
    public function profileSubmit(Request $request){
        $customer_id = session()->get('user');
        
        $c = Customer::where('id', $customer_id)->first();
        $c->phone=$request->phone;
        $c->name=$request->name;
        $c->save();
        
        return redirect(route('products.list'));
        
    }

}