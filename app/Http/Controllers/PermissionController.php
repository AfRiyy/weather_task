<?php

namespace App\Http\Controllers;

use App\Models\Permission;
use App\Models\User;
use App\Models\userpermission;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PermissionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = $this->getUserData();
        // return ["permissions" => $data];
        return view('permission.all', ["permissions" => $data]);
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
    public function show(Permission $permission)
    {
        //
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
    public function update(Request $request, Permission $permission)
    {
        //
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
        $permissions = userpermission::where('user_id', $user->id)->get();
        foreach ($permissions as $permission) {
            $permissionData[] =  ["permission name" => $permission->permission_id];
        }
        $user = array(
            'id' => $user->id,
            'name' => $user->name,
        );
        $userData = $user + array('permissions' => $permissionData);
        return $userData;
    }
}
