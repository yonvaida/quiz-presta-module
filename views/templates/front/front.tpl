<div>

<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#quizModal">{$Button}</button>

<div id="quizModal" class="modal fade" role="dialog">
  <div class="modal-dialog">
   <div class="modal-content" >
      {foreach from=$results item=row}
          <div id="header_{$row['id_Quizmodule']}" class="modal-header" 
          {if $row['id_Quizmodule'] != 1}
            style="display:none
          {/if}">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">{$row["Question"]}</h4>
          </div>
          <div id="body_{$row["id_Quizmodule"]}" class="modal-body"      
            {if $row['id_Quizmodule'] != 1}
              style="display:none
            {/if}">
          <input type="radio" id="question1" name="question{}">{$row["Answer_1"]}</input></br>
          <input type="radio" id="question2" name="question">{$row["Answer_2"]}</input></br>
          <input type="radio" id="question3" name="question">{$row["Answer_3"]}</input></br>
          <input type="radio" id="question4" name="question">{$row["Answer_4"]}</input></br>
        </div>
      {/foreach}
      
      <div class="modal-footer">
        <button type="button" class="btn btn-info btn-lg" onclick="nextQuestion()">NEXT</button>
        <button type="button" class="btn btn-info btn-lg" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>