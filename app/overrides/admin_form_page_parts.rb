Deface::Override.new(:virtual_path => %q{refinery/admin/pages/_form_page_parts},
                     :name => %q{add_ff_to_page_part_field},
                     :replace => %q{erb[loud]:contains("render 'page_part_field'")},
                     :text => %q{
            <%= render 'page_part_field',
                       :f => p,
                       :part => p.object,
                       :part_index => (part_index += 1),
                       :new_part => @page.new_record? -%>
                          })