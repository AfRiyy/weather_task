<?php

namespace App\Http\Controllers;

use App\Models\Post;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Gate;
class PostController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $id = auth()->user()->id;
        $posts = Post::where('user_id', $id)->get();
        // echo "<pre>";
        // foreach ($posts as $post) {
        //     print_r(json_decode($post->data, true)['coord']);
        // }
        return view('posts.posts', ["posts" => $posts]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        if (Gate::allows('create-post')) {
        $lat = $request->all()['lat'];
        $lon = $request->all()['lon'];
        $post = Http::post("https://api.openweathermap.org/data/2.5/weather?lat=" . $lat . "&lon=" . $lon . "&appid=5c37ee27ce364891f4bc883d80dcafa0");
        $id = auth()->user()->id;
        $post = Post::create([
            "user_id" => $id,
            "data" => $post
        ]);
        return redirect('posts');
        }
        else{
            return redirect('posts');
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        // dd($request->all());
        $lat = $request->all()['lat'];
        $lon = $request->all()['lon'];
        $weather = Http::post("https://api.openweathermap.org/data/2.5/weather?lat=" . $lat . "&lon=" . $lon . "&appid=5c37ee27ce364891f4bc883d80dcafa0");
        $post = Post::find($request->all()['id']);
        $post['data'] = $weather;
        $post->save();
        return redirect('posts');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        if (Gate::allows('delete-post')) {
        Post::destroy($id);
        return redirect('posts');
        }
        else{
            return redirect('posts');
        }
    }
}
