<?php
   
namespace App\Http\Controllers;
  
use Illuminate\Http\Request;
use App\Mail\MyDemoMail;
use Mail;
   
class HomeController extends Controller
{
  
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function myDemoMail()
    {
        $myEmail = '';
   
        $details = [
            'title' => 'Mail Demo from Adv Web',
            'url' => 'https://www.aiub.edu'
        ];
  
        Mail::to($myEmail)->send(new MyDemoMail($details));
   
        dd("Mail Send Successfully");
    }
}