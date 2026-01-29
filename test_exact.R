    script <- tags$script(HTML("
      (function() {
        function toggleManual(select) {
          var player = select.dataset.player;
          var date = select.dataset.date;
          var manual = document.querySelector('input.workload-manual-input[data-player=\"' + player + '\"][data-date=\"' + date + '\"]');
          var enabled = ['B+','A','A+'].includes(select.value);
          if (manual) {
            manual.disabled = !enabled;
            if (!enabled) manual.value = '';
          }
        }
      })();
    "))
