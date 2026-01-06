@param org.springframework.security.web.csrf.CsrfToken csrf
@param java.util.List<com.expenses.dto.CategoryDTO> categories
@param String successMessage

@template.layout.index(content = @`
    <div class="container">

        <!-- New Category Card -->
        <div class="card shadow-sm border mb-4">

            <div class="card-header bg-white">
                <h5 class="mb-0">New Category</h5>
            </div>

            <div class="card-body">

                <!-- Success Message -->
                @if(successMessage != null)
                    <div id="successAlert" class="alert alert-success alert-dismissible fade show" role="alert">
                        ${successMessage}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                @endif

                <!-- Add Category Form -->
                <form method="post" action="/categories/save" class="row g-3 align-items-center">
                    <input type="hidden" name="${csrf.getParameterName()}" value="${csrf.getToken()}" />
                    <div class="col-md-8">
                        <label for="descriptionInput" class="form-label">Description</label>
                        <input
                                id="descriptionInput"
                                type="text"
                                name="description"
                                required
                                class="form-control"
                        />
                    </div>

                    <div class="col-md-4 d-flex align-items-end">
                        <button type="submit" class="btn btn-success">
                            Save
                        </button>
                    </div>
                </form>

            </div>
        </div>

        <!-- Categories List Card -->
        <div class="card shadow-sm border">

            <div class="card-header bg-white">
                <h5 class="mb-0">Categories</h5>
            </div>

            <div class="card-body">

                <!-- Scrollable Table -->
                <div class="table-responsive" style="max-height: 400px; overflow-y: auto;">
                    <table class="table table-bordered table-hover align-middle mb-0">
                        <thead class="table-light sticky-top">
                        <tr>
                            <th style="width: 60px;">#</th>
                            <th>Description</th>
                            <th class="text-center" style="width: 120px;">Action</th>
                        </tr>
                        </thead>
                        <tbody id="categoryTableBody">
                        @for (int i = 0; i < categories.size(); i++)
                            <tr>
                                <td class="text-center">${i + 1}</td>
                                <td>${categories.get(i).description()}</td>
                                <td class="text-center">
                                    <form
                                            method="post"
                                            action="/categories/delete"
                                            onsubmit="return confirm('Delete this category?')"
                                            class="d-inline"
                                    >
                                        <input type="hidden" name="${csrf.getParameterName()}" value="${csrf.getToken()}" />
                                        <input type="hidden" name="id" value="${categories.get(i).id()}" />
                                        <button class="btn btn-sm btn-danger">
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

    </div>
`)
