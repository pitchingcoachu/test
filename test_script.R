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
        window.workloadTypeChange = function(select) {
          toggleManual(select);
          Shiny.setInputValue('workload_day_type', {
            player: select.dataset.player,
            date: select.dataset.date,
            type: select.value
          }, {priority: 'event'});
        };
        window.workloadManualChange = function(input) {
          var value = parseFloat(input.value);
          var throwsValue = isFinite(value) ? value : null;
          Shiny.setInputValue('workload_day_manual', {
            player: input.dataset.player,
            date: input.dataset.date,
            throws: throwsValue
          }, {priority: 'event'});
        };
        window.workloadInitializeSelectors = function() {
          document.querySelectorAll('select.workload-type-select').forEach(function(select) {
            toggleManual(select);
          });
        };
        document.addEventListener('DOMContentLoaded', window.workloadInitializeSelectors);
        if (document.readyState === 'complete') {
          window.workloadInitializeSelectors();
        }
        window.workloadInitializeSelectors();
      })();
    "))
