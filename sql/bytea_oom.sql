create or replace function noop(data bytea) returns void as $$
$$ language plv8;

select count(noop(repeat('0', 1024*1024)::bytea)) from generate_series(0, 200*1000);
