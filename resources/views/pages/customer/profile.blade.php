@extends('layouts.app')
@section('content')

    <form action="{{ route('profileSubmit') }}" method="POST" enctype="multipart/form-data">
            @csrf
            <div class="container">
                <div class="row ">
                <div class="form-group">
                    <label>Phone</label>
                    <input type="text" name="phone" placeholder="Phone" class="form-control" value="{{$c->phone}}">
                </div>
                <br>
                    <label>Name</label>
                <div class="form-group">
                    <input type="text" name="name" placeholder="Name" class="form-control" value="{{$c->name}}">
                </div>
                <br>
                
                <div class="form-group">
                    <button type="submit" class="btn btn-success">Update</button>
                </div>
     
            </div>
            </div>
            
        </form>
@endsection