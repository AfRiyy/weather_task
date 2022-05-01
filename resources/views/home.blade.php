@extends('layouts.master')
@section('title', 'HomePage')

@section('content')
<div class="row">
    <div class="col-12">
        <div id="caption">
            <span id="border"><h1>The project</h1></span>
        </div>
    </div>
</div>
    <div class="row">
            <div class="col-sm-6">
                <div class="card">
                  <div class="card-body">
                    <h5 class="card-title">Permissions</h5>
                    <p class="card-text">Admins can:</p>
                    <ul class="list-group">
                        <li class="list-group-item">Manage other users permissions</li>
                        <li class="list-group-item">Delete other users</li>
                    </ul>
                    <a href="{{ route('permissions') }}" class="btn btn-primary mt-3">Go to permissions</a>
                  </div>
                </div>
              </div>
              <div class="col-sm-6">
                <div class="card">
                  <div class="card-body">
                    <h5 class="card-title">Posts</h5>
                    <p class="card-text">Managing weather data</p>
                    <ul class="list-group">
                        <li class="list-group-item">Make post, and get weather data</li>
                        <li class="list-group-item">Delete post</li>
                    </ul>
                    <a href="{{ route('posts') }}" class="btn btn-primary mt-3">Go to posts</a>
                  </div>
                </div>
              </div>
        </div>
@endsection
