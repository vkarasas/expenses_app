@param java.util.List<com.expenses.dto.ExpenseDTO> expenses
@param String successMessage
@param org.springframework.security.web.csrf.CsrfToken csrf

@template.layout.index(content = @`
    <div class="container mt-4">

        <!-- Expenses Card -->
        <div class="card shadow-sm border mb-4">

            <!-- Panel Header -->
            <div class="card-header bg-white d-flex justify-content-between align-items-center">
                <h5 class="mb-0">Expenses</h5>
                <button type="button" class="btn btn-primary" onclick="window.location.href='/expenses/new'">
                    New Expense
                </button>
            </div>

            <div class="card-body">

                <!-- Success Message -->
                @if(successMessage != null)
                    <div id="successAlert" class="alert alert-success alert-dismissible fade show" role="alert">
                        ${successMessage}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                @endif

                <!-- Scrollable Table -->
                <div class="table-responsive" style="max-height: 500px; overflow-y: auto;">
                    <table class="table table-bordered table-hover align-middle mb-0">
                        <thead class="table-light sticky-top">
                        <tr>
                            <th style="width: 60px;">#</th>
                            <th class="text-center">Category</th>
                            <th class="text-center">Description</th>
                            <th class="text-center">Date</th>
                            <th class="text-end">Total Amount</th>
                            <th class="text-center" style="width: 120px;">Action</th>
                        </tr>
                        </thead>
                        <tbody id="expenseTableBody">
                        @for (int i = 0; i < expenses.size(); i++)
                            <tr>
                                <td class="text-center">${i + 1}</td>
                                <td class="text-center">${expenses.get(i).categoryDescription()}</td>
                                <td class="text-center">${expenses.get(i).description()}</td>
                                <td class="text-center">${expenses.get(i).date().toString()}</td>
                                <td class="text-end">
                                    ${expenses.get(i).totalAmount().setScale(2, java.math.RoundingMode.HALF_UP)} €
                                </td>
                                <td class="text-center">
                                    <form
                                            method="post"
                                            action="/expenses/delete"
                                            onsubmit="return confirm('Delete this expense?')"
                                    >
                                        <input type="hidden" name="id" value="${expenses.get(i).id()}" />
                                        <input type="hidden" name="${csrf.getParameterName()}" value="${csrf.getToken()}" />
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
