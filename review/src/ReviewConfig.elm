module ReviewConfig exposing (..)

{-| Do not rename the ReviewConfig module or the config function, because
`elm-review` will look for these.

To add packages that contain rules, add them to this review project using

    `elm install author/packagename`

when inside the directory containing this file.

-}

import Elm.Syntax.Expression exposing (Expression)
import Elm.Syntax.ModuleName exposing (ModuleName)
import Elm.Syntax.Node exposing (Node)
import Review.Rule as Rule exposing (Error, ModuleRuleSchema, Rule)


type alias ProjectContext =
    ()


config : List Rule
config =
    []


rule : Rule
rule =
    Rule.newProjectRuleSchema "PidgTrans" ()
        |> Rule.withModuleVisitor moduleVisitor
        |> Rule.withModuleContext
            { fromProjectToModule = \_ _ _ -> ()
            , fromModuleToProject = fromModuleToProject
            , foldProjectContexts = foldProjectContexts
            }
        |> Rule.withFinalProjectEvaluation finalEvaluationForProject
        |> Rule.fromProjectRuleSchema


finalEvaluationForProject : ProjectContext -> List (Error { useErrorForModule : () })
finalEvaluationForProject projectContext =
    []


foldProjectContexts : ProjectContext -> ProjectContext -> ProjectContext
foldProjectContexts newContext previousContext =
    newContext


fromModuleToProject : Rule.ModuleKey -> Node ModuleName -> () -> ProjectContext
fromModuleToProject moduleKey moduleName moduleContext =
    ()


fromProjectToModule : Rule.ModuleKey -> Node ModuleName -> ProjectContext -> ()
fromProjectToModule moduleKey moduleName projectContext =
    ()


moduleVisitor : ModuleRuleSchema {} () -> ModuleRuleSchema { hasAtLeastOneVisitor : () } ()
moduleVisitor schema =
    schema |> Rule.withExpressionVisitor expressionVisitor


expressionVisitor : Node Expression -> Rule.Direction -> () -> ( List (Error {}), () )
expressionVisitor node direction context =
    ( [], context )
