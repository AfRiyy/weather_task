@extends('layouts.master')
@section('title','Create permission')

@section('content')
<div class="row justify-content-center">

    <div class="col-4 mt-3">
        <h5 class="text-center">Here you can add a new permission</h5>
        <div>
            <form class="form-control" action="/permissions/store" method="post">
                <label class="form-label" for="permission">Permission</label>
                <input class="form-control" type="text" id="permission" name="permission">
                <div class="d-flex justify-content-around">
                    <button class="btn btn-outline-info mt-2" type="submit">Submit</button>
                    <a class="btn btn-outline-info mt-2" href="/permissions">Back</a>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection