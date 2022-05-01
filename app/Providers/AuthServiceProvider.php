<?php

namespace App\Providers;

use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\DB;
use App\Models\User;
use App\Models\Post;
class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array<class-string, class-string>
     */
    protected $policies = [
        // 'App\Models\Model' => 'App\Policies\ModelPolicy',
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();

        Gate::define('set-permission', function(){
            $id = auth()->user()->id;
            $permission = DB::table('userpermissions')->select('permission_id')->where('permission_id','=',1)->where('user_id',$id)->first();
            if($permission != null){
                return true;
            }
        });
        Gate::define('create-post', function(){
            $id = auth()->user()->id;
            $permission = DB::table('userpermissions')->select('permission_id')->where('permission_id','=',2)->where('user_id',$id)->first();
            if($permission != null){
                return true;
            }
        });
        Gate::define('edit-post', function(){
            $id = auth()->user()->id;
            $permission = DB::table('userpermissions')->select('permission_id')->where('permission_id','=',3)->where('user_id',$id)->first();
            if($permission != null){
                return true;
            }
        });
        Gate::define('delete-post', function(){
            $id = auth()->user()->id;
            $permission = DB::table('userpermissions')->select('permission_id')->where('permission_id','=',4)->where('user_id',$id)->first();
            if($permission != null){
                return true;
            }
        });
    }
}
