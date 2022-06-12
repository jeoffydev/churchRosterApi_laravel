 
<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="{{ URL::asset('dist/css/bootstrap.min.css') }}" />
        <title>Churster</title>

     </head>
    <body class="antialiased">
        <div class="container">
            @yield('content')
        </div>
    </body>
</html>