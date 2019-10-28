%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  This file is part of Logtalk <https://logtalk.org/>
%  Copyright 1998-2019 Paulo Moura <pmoura@logtalk.org>
%
%  Licensed under the Apache License, Version 2.0 (the "License");
%  you may not use this file except in compliance with the License.
%  You may obtain a copy of the License at
%
%      http://www.apache.org/licenses/LICENSE-2.0
%
%  Unless required by applicable law or agreed to in writing, software
%  distributed under the License is distributed on an "AS IS" BASIS,
%  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%  See the License for the specific language governing permissions and
%  limitations under the License.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- initialization((
    logtalk_load([ meta(loader)
                 , hierarchies(loader)
                 , types(loader)
                 ])
)).

:- if(current_logtalk_flag(tabling, supported)).

    :- if((
        current_logtalk_flag(prolog_dialect, swi),
        current_prolog_flag(version_data, swi(Major, Minor, Patch, _)),
        Major =< 7, Minor =< 7, Patch =< 13
        )).
        :- use_module(library(tabling)).
    :- endif.

	:- initialization(
		logtalk_load(fluents_tabled, [optimize(on)])
    ).

:- else.

	:- initialization(
		logtalk_load(fluents, [optimize(on)])
    ).

:- endif.


:- initialization(
    logtalk_load(situations, [optimize(on)])
).