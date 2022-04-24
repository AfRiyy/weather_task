@extends('layouts.master')
@section('title','All permissions')

@section('content')
<div class="row">
    <div class="col-8">
        <h1>Permissions works!</h1>
        <table class="table">
            <thead>
                <th>User</th>
                <th>Set Permissions</th>
                <th>Create post</th>
                <th>Update post</th>
                <th>Delete post</th>
            </thead>
            <tbody>
                @foreach ($permissions as $permission)
                <tr>
                    <td>{{$permission['name']}}</td>
                    @if ($permission['permission']['0'] == '1')
                    <td><input type="checkbox" name="set_permission" id="set_permission"></td>
                    @else
                    <td><input type="checkbox" name="set_permission" id="set_permission" checked></td>
                    @endif
                    <td><input type="checkbox" name="set_permission" id="set_permission" checked></td>
                    <td><input type="checkbox" name="set_permission" id="set_permission" checked></td>
                    <td><input type="checkbox" name="set_permission" id="set_permission" checked></td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</div>
@endsection