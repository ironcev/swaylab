; ModuleID = 'Play02.cpp'
source_filename = "Play02.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Inner = type { i32 }
%struct.A = type { %struct.Inner, [4 x i32] }

@__const._Z3foov.i = private unnamed_addr constant %struct.Inner { i32 112233 }, align 4

; Function Attrs: mustprogress noinline nounwind uwtable
define dso_local void @_Z3foov() #0 {
  %1 = alloca %struct.Inner, align 4
  %2 = alloca %struct.A, align 4
  %3 = alloca %struct.A, align 4
  %4 = alloca %struct.A, align 4
  %5 = bitcast %struct.Inner* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %5, i8* align 4 bitcast (%struct.Inner* @__const._Z3foov.i to i8*), i64 4, i1 false)
  %6 = bitcast %struct.A* %2 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 4 %6, i8 0, i64 20, i1 false)
  %7 = getelementptr inbounds %struct.A, %struct.A* %2, i32 0, i32 0
  %8 = bitcast %struct.Inner* %7 to i8*
  %9 = bitcast %struct.Inner* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 4 %9, i64 4, i1 false)
  %10 = getelementptr inbounds %struct.A, %struct.A* %2, i32 0, i32 1
  %11 = getelementptr inbounds [4 x i32], [4 x i32]* %10, i64 0, i64 0
  %12 = bitcast %struct.A* %3 to i8*
  %13 = bitcast %struct.A* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %12, i8* align 4 %13, i64 20, i1 false)
  %14 = bitcast %struct.A* %4 to i8*
  %15 = bitcast %struct.A* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %14, i8* align 4 %15, i64 20, i1 false)
  %16 = bitcast %struct.A* %4 to i8*
  %17 = bitcast %struct.A* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %16, i8* align 4 %17, i64 20, i1 false)
  ret void
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: mustprogress noinline norecurse nounwind uwtable
define dso_local noundef i32 @main() #3 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @_Z3foov()
  ret i32 0
}

attributes #0 = { mustprogress noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly nofree nounwind willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { mustprogress noinline norecurse nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
