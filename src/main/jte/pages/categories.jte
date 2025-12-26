@param java.util.List<com.expenses.dto.CategoryDTO> categories

@template.layout.index(content = @`
<h1>Categories</h1>

<ul>
    @for(com.expenses.dto.CategoryDTO category : categories)
        <li>${category.getDescription()}</li>
    @endfor
</ul>

<form method="post" action="/categories/save">
    <label>Description</label>
    <input type="text" name="description" required/>
    <button type="submit" name="save">Save</button>
</form>
`)
