do $$
  for(let i = 0; i < 2000; i++) {
    plv8.execute(`
      with x as (
        select string_agg(gen_random_bytes(1024), '\\000'::bytea) data from generate_series(0, 1024)
      )
      select noop(data) from x, generate_series(0, 100)
    `);
  }
$$ language plv8;
