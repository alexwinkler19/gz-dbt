{% macro margin_percent(margin, revenue, macro_var=2) %}
     round(safe_divide({{margin}},{{revenue}}),{{macro_var}})
 {% endmacro %}