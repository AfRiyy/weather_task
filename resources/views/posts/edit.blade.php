@section('edit')
<div class="modal fade" id="modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel"></h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <form action="/posts/update" method="post" class="form-control shadow-lg rounded">
                @csrf
                @method('put')
                <input type="text" id="id" hidden data-target="#id" name="id">
                <label class="form-label" for="lat">Latide</label>
                <input id="lat" class="form-control" type="text" name="lat" data-target="#lat">
                <label class="form-label" for="lon">Longitude</label>
                <input id="lon" class="form-control" type="text" name="lon" data-target="#lon">
                <button type="submit" class="btn btn-outline-primary">Save changes</button>
            </form>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
@endsection
