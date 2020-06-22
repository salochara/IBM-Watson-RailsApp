
function dataTable(){
  console.log("its me")
  $(document).on('turbolinks:load',function(){
    $("table[role='datatable']").each(function()
    {
      $(this).DataTable({})
    });
  });
}

export { dataTable }
