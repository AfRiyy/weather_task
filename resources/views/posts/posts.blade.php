@extends('layouts.master')
@include('posts.edit')
@section('content')
    <div class="row my-3">
        @can('create-post')
        <div class="col-4">
            <form action="/posts/create" method="post" class="form-control shadow-lg rounded">
                @csrf
                <label class="form-label" for="lat">Latide</label>
                <input class="form-control" type="text" name="lat">
                <label class="form-label" for="lon">Longitude</label>
                <input class="form-control" type="text" name="lon">
                <button class="btn btn-outline-info my-3" type="submit">Get weather data</button>
            </form>
        </div>
        @endcan
    </div>
    <div class="row">
        <div class="col-12">
            <ul class="list-group panel-group">
                @foreach ($posts as $post)
                    <li class="list-group-item my-1 shadow rounded bg-info" data-bs-toggle="collapse" href="#collapse{{$post->id}}" role="button" aria-expanded="false" aria-controls="collapse">
                        <h3 class="panel-title" >
                        {{ json_decode($post->data, true)['name'] }} -
                        @php
                        $dt = new DateTime();
                        $dt->setTimeZone(new DateTimeZone('Europe/Budapest'));
                        $dt->setTimestamp(json_decode($post->data, true)['dt']);
                        echo $dt->format("Y-m-d H:i:s");
                        @endphp
                        <img src="http://openweathermap.org/img/wn/{{json_decode($post->data, true)['weather'][0]['icon']}}@2x.png" alt="icon">
                    </h3>
                </li>
                        <div id="collapse{{$post->id}}" class="collapse bg-white p-2">
                            <div class="panel-body">
                                <input type="text" id="id" hidden value="{{$post->id}}">
                                <input type="text" id="lon" hidden value="{{json_decode($post->data, true)['coord']['lon']}}">
                                <input type="text" id="lat" hidden value="{{json_decode($post->data, true)['coord']['lat']}}">
                                <p>Temperature: {{json_decode($post->data, true)['main']['temp']-273.15."°C"}}</p>
                                <p>Weather: {{json_decode($post->data, true)['weather'][0]['description']}}</p>
                                <p>Wind: {{json_decode($post->data, true)['wind']['speed']*3,6}} km/h</p>
                            </div>
                            <div class="panel-footer">
                                @can('delete-post')
                                <hr class="my-2">
                                <a href="/posts/delete/{{$post->id}}" method="submit" class="btn btn-danger my-2">Remove post</a>
                            @endcan
                            @can('edit-post')
                            <button type="button" class="btn btn-outline-primary edit" data-bs-toggle="modal" data-bs-target="#modal" onClick="getDataToModal()">
                                Edit
                            </button>
                            @endcan
                            </div>
                        </div>
                @endforeach
            </ul>
        </div>
    </div>

    @yield('edit')

    <script type="text/javascript">
    function getDataToModal(){
            var button = event.path[0];
            var lon = button.parentElement.parentElement.querySelector('.panel-body').querySelector('#lon').value;
            var lat = button.parentElement.parentElement.querySelector('.panel-body').querySelector('#lat').value;
            var id = button.parentElement.parentElement.querySelector('.panel-body').querySelector('#id').value;
            var cityAndDate = button.parentElement.parentElement.previousElementSibling.querySelector('h3').textContent;
            document.querySelector('.modal-body').querySelector('#lon').value = lon;
            document.querySelector('.modal-body').querySelector('#lat').value = lat;
            document.querySelector('.modal-body').querySelector('#id').value = id;
            document.querySelector('.modal-header').querySelector('h5').innerHTML = cityAndDate;
    }
    </script>
@endsection
