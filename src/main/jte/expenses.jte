@param String title = "Expenses App"
@param java.util.List<String> categories


<!DOCTYPE html>
<html lang="el">
<head>
    <title>${title}</title>
</head>
<body>
<h1>Categories</h1>

<ul>
    @for(String category : categories)
        <li>${category}</li>
    @endfor
</ul>
</body>
</html>
