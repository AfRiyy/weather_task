@extends('layouts.master')
@section('title','All permissions')

@section('content')
<div class="row my-4">
    <div class="col-12">
        <table class="table">
            <thead>
                <th>User</th>
                <th>Set Permissions</th>
                <th>Create post</th>
                <th>Update post</th>
                <th>Delete post</th>
            </thead>
            <tbody>

                @foreach($users as $user)
                <tr>
                    <td>{{$user->name}}</td>
                    <form action="/permissions/edit/{{$user->id}}" method="post">
                        @csrf
                        @method("put")
                        <td>
                            <div><input type="checkbox" name="set-permission" @if($user->set_permission){{'checked=checked value=1'}} @endif></div>
                        </td>
                        <td>
                            <div><input type="checkbox" name="create-post" @if($user->create_post){{'checked=checked value=1'}} @endif></div>
                        </td>
                        <td>
                            <div><input type="checkbox" name="update-post" @if($user->update_post){{'checked=checked value=1'}} @endif></div>
                        </td>
                        <td>
                            <div><input type="checkbox" name="delete-post" @if($user->delete_post){{'checked=checked value=1'}} @endif></div>
                        </td>
                        @can('set-permission')
                        <td>
                            <button type="submit" class="btn btn-outline-info">Edit</button>
                            <a href="/delete-user/{{$user->id}}" class="btn btn-outline-danger">Delete user</a>
                        </td>
                        @endcan
                    </form>
                </tr>
                @endforeach

            </tbody>
        </table>
    </div>
</div>
@endsection
