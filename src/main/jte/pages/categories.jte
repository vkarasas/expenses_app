@param java.util.List<com.expenses.dto.CategoryDTO> categories
@param String successMessage

@template.layout.index(content = @`
    <div class="max-w-6xl mx-auto bg-white rounded-xl shadow-md border border-gray-200">

        <!-- Panel Header -->
        <div class="px-6 py-4 border-b border-gray-200">
            <h2 class="text-lg font-semibold text-gray-800">
                New Category
            </h2>
        </div>

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
        <form method="post" action="/categories/save" onsubmit="save" class="p-6 space-y-5">
            <!-- Description -->
            <div class="grid grid-cols-4 sm:grid-cols-4 items-center gap-4">
                <label class="text-sm font-medium text-gray-700">Description</label>
                <input
                        id="descriptionInput"
                        type="text"
                        name="description"
                        required
                        class="sm:col-span-2 rounded-lg border border-gray-300 px-3 py-2 text-sm
               focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                />
                <button type="submit"
                        class="bg-green-600 text-white px-2 py-2 text-sm rounded hover:bg-green-700 w-fit"
                >
                    Save
                </button>
            </div>

        </form>
    </div>

    <div class="max-w-6xl mx-auto bg-white rounded-xl shadow-md border border-gray-200 mt-6">
        <!-- Panel Header -->
        <div class="px-6 py-4 border-b border-gray-200">
            <h2 class="text-lg font-semibold text-gray-800">
                Categories
            </h2>
        </div>

        <!-- Categories Table -->
        <div class="flex justify-center mt-3 mb-4">
            <!-- Scroll + Border wrapper -->
            <div class="max-h-[400px] overflow-y-auto w-11/12 border-2 border-gray-300 rounded-lg">
                <table class="w-full border-collapse">
                    <thead class="bg-gray-100 sticky top-0 z-10">
                    <tr>
                        <th class="px-4 py-2 border text-left w-12">#</th>
                        <th class="px-4 py-2 border text-left">Description</th>
                        <th class="px-4 py-2 border text-center w-24">Action</th>
                    </tr>
                    </thead>
                    <tbody id="categoryTableBody">
                    @for (int i = 0; i < categories.size(); i++)
                        <tr class="hover:bg-gray-50">
                            <td class="px-4 py-2 border text-center">${i + 1}</td>
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
    </div>
`)
