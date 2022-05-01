<?php

namespace App\Http\Controllers;

use App\Models\Permission;
use App\Models\User;
use App\Models\userpermission;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Gate;
class PermissionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if (Gate::allows('set-permission')) {
        $users = $this->getUserData();
        return view('permission.all', ["users" => $users]);
        }
        else{
            return redirect('/');
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('permission.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Permission  $permission
     * @return \Illuminate\Http\Response
     */
    public function show()
    {
        // $id = auth()->user()->id;
        // $permissions = DB::table('userpermissions')->select('permission_id')->where('permission_id','=',1)->where('user_id',$id)->first();
        // echo "<pre>";
        // print_r($permissions->permission_id);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Permission  $permission
     * @return \Illuminate\Http\Response
     */
    public function edit(Permission $permission)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Permission  $permission
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $permissions = $request->all();
        print("<pre>");
        print_r($permissions);
        DB::table('userpermissions')->where('user_id', $id)->delete();
        if(isset($permissions['set-permission'])){
            DB::table('userpermissions')->insert(['user_id' => $id, 'permission_id' => 1]);
        }
        if(isset($permissions['create-post'])){
            DB::table('userpermissions')->insert(['user_id' => $id, 'permission_id' => 2]);
        }
        if(isset($permissions['update-post'])){
            DB::table('userpermissions')->insert(['user_id' => $id, 'permission_id' => 3]);
        }
        if(isset($permissions['delete-post'])){
            DB::table('userpermissions')->insert(['user_id' => $id, 'permission_id' => 4]);
        }
        return redirect('/permissions');
        // for ($i=0; $i < count($permissions['permissions']); $i++) {
        //     print($permissions['permissions'][$i]);
        // }
        // foreach($permissions['permissions'] as $element){
        //     if($element == 'on')
        //     print($element);
        // }
        //
        // for ($i = 0; $i < count($request->permissions); $i++) {
        //     $keys = array_keys($request->permissions);
        //     DB::table('userpermissions')->insert(['user_id' => $id, 'permission_id' => $keys[$i] + 1]);
        // }
        // return redirect('/permissions');


        // if (Gate::allows('set-permission')) {
        //     $user = User::find($id);
        //     DB::table('userpermissions')->where('user_id', $id)->delete();
        //     for ($i = 0; $i < count($request->permissions); $i++) {
        //         $keys = array_keys($request->permissions);
        //         DB::table('userpermissions')->insert(['user_id' => $id, 'permission_id' => $keys[$i] + 1]);
        //     }
        //     return redirect('/permissions');
        // }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Permission  $permission
     * @return \Illuminate\Http\Response
     */
    public function destroy(Permission $permission)
    {
        //
    }

    private function getUserData()
    {
        $users = User::all();
        foreach ($users as $user) {
            $userData[] = $this->readData($user);
        }
        return $userData;
    }
    private function readData($user)
    {
        $set_permission = userpermission::select('permission_id')->where('user_id', $user->id)->where('permission_id',1)->first();
        $create_post = userpermission::select('permission_id')->where('user_id', $user->id)->where('permission_id',2)->first();
        $update_post = userpermission::select('permission_id')->where('user_id', $user->id)->where('permission_id',3)->first();
        $delete_post = userpermission::select('permission_id')->where('user_id', $user->id)->where('permission_id',4)->first();

        $user = (object) array(
            'id' => $user->id,
            'name' => $user->name,
            'set_permission' => ($set_permission != null ? true : false),
            'create_post' => ($create_post != null ? true : false),
            'update_post' => ($update_post != null ? true : false),
            'delete_post' => ( $delete_post != null ? true : false),
        );
        return $user;
    }
}
