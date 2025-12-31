@param java.util.List<com.expenses.dto.CategoryDTO> categories
@param String successMessage

@template.layout.index(content = @`
    <div class="max-w-3xl mx-auto p-6">

        <h1 class="text-2xl font-semibold mb-6">Categories</h1>
        <!-- Success Message -->
        @if(successMessage != null)
            <div
                    id="successAlert"
                    class="mb-4 flex items-center justify-between rounded bg-green-100 border border-green-300 text-green-800 px-4 py-2"
            >
                <span>${successMessage}</span>

                <button
                        type="button"
                        onclick="document.getElementById('successAlert').remove()"
                        class="ml-4 text-green-800 hover:text-green-900 font-bold"
                        aria-label="Close"
                >
                    ✕
                </button>
            </div>
        @endif
        <!-- Add Category Form -->
        <form method="post" action="/categories/save" onsubmit="save" class="flex gap-3 mb-6">
            <input
                    id="descriptionInput"
                    type="text"
                    name="description"
                    required
                    placeholder="New category"
                    class="flex-1 border rounded px-3 py-2 focus:outline-none focus:ring focus:ring-blue-300"
            />

            <button
                    type="submit"
                    class="bg-green-600 text-white px-4 py-2 rounded hover:bg-green-700"
            >
                Save
            </button>
        </form>

        <!-- Categories Table -->
        <div class="overflow-x-auto">
            <table class="min-w-full border border-gray-200 rounded-lg">
                <thead class="bg-gray-100">
                <tr>
                    <th class="px-4 py-2 border text-left w-12">#</th>
                    <th class="px-4 py-2 border text-left">Description</th>
                    <th class="px-4 py-2 border text-center w-24">Action</th>
                </tr>
                </thead>
                <tbody id="categoryTableBody">
                @for (int i = 0; i < categories.size(); i++)
                    <tr class="hover:bg-gray-50">
                        <td class="px-4 py-2 border text-center">${i + 1}</td> <!-- Row number -->
                        <td class="px-4 py-2 border">${categories.get(i).description()}</td>
                        <td class="px-4 py-2 border text-center">
                            <form
                                    method="post"
                                    action="/categories/delete"
                                    onsubmit="return confirm('Delete this category?')"
                            >
                                <input type="hidden" name="id" value="${categories.get(i).id()}" />
                                <button class="bg-red-500 text-white px-3 py-1 rounded hover:bg-red-600">
                                    Delete
                                </button>
                            </form>
                        </td>
                    </tr>
                @endfor
                </tbody>
            </table>
        </div>

    </div>
    <script>
        function removeAlert() {
            const alert = document.getElementById("successAlert");
            if (alert) alert.remove();
        }

        // Auto-remove after 10 seconds
        setTimeout(removeAlert, 10000);
    </script>
`)
